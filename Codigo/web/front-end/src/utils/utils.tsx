import { realtimeDatabase } from "../api/api";

export const composeFormData = (obj: object) => {
	const formData = new FormData();
	const keys = Object.keys(obj);
	const values = Object.values(obj);

	keys.forEach((key, index) => {
		const value = values[index];

		formData.append(key, value);
	});

	return formData;
};

export const objectToArray = (obj: object) => {
	const keys = Object.keys(obj);
	const array: Array<any> = [];

	keys.forEach((key) => {
		array.push({
			...obj[key],
			key,
		});
	});

	return array;
};

export const getFlattenedKeyMap = (array: any[], key: string) => {
	const keyMap = {};

	array.forEach((item) => {
		const objKey = item[key];
		keyMap[objKey] = true;
	});

	return Object.keys(keyMap);
};

export const flattenByKey = (array: any[], key: string) => {
	const keyMap = {};

	const flattenedArray = array.filter((item) => {
		const objKey = item[key];
		const comp = keyMap[objKey] === undefined;
		keyMap[objKey] = true;

		return comp;
	});

	return flattenedArray;
};

export const countByKey = (array: any[], key: string, value: string) => {
	const filtered = array.filter((item) => {
		const objKey = item[key];
		return objKey === value;
	});

	return filtered.length;
};

export const getViewsCount = (
	selectedOption: string,
	initDate?: Date,
	endDate?: Date,
	userId?: string
) => {
	return new Promise((resolve) => {
		realtimeDatabase()
			.ref(`app/${selectedOption}_view`)
			.on("value", (viewSnapshot) => {
				realtimeDatabase()
					.ref(`app/${selectedOption}`)
					.on("value", (itemSnapshot) => {
						if (!viewSnapshot.val() || !itemSnapshot.val()) {
							resolve([]);
							return;
						}
						let itemsArray = objectToArray(viewSnapshot.val());
						if (initDate) {
							itemsArray = itemsArray.filter((item) => {
								const itemDate = new Date(item.date + "T00:00:00").getTime();
								return itemDate >= initDate.getTime();
							});
						}
						if (endDate) {
							itemsArray = itemsArray.filter((item) => {
								const itemDate = new Date(item.date + "T00:00:00").getTime();
								return itemDate <= endDate.getTime();
							});
						}
						if (userId) {
							itemsArray = itemsArray.filter((item) => item.user_id === userId);
						}

						const currStatItems: any[] = [];

						flattenByKey(itemsArray, `${selectedOption}_id`).forEach((item) => {
							const id = item[`${selectedOption}_id`];
							const itemValue = itemSnapshot.val()[id];
							const viewCount = countByKey(
								itemsArray,
								`${selectedOption}_id`,
								id
							);

							currStatItems.push({
								displayName: itemValue.title,
								viewCount,
							});
						});

						resolve(currStatItems);
					});
			});
	});
};

export const getCalculatorViewsCount = (
	initDate?: Date,
	endDate?: Date,
	userId?: string
) => {
	return new Promise((resolve) => {
		realtimeDatabase()
			.ref("app/calculator_view")
			.on("value", (viewSnapshot) => {
				if (!viewSnapshot.val()) {
					resolve([]);
					return;
				}

				const keyMap = {};
				let itemsArray = objectToArray(viewSnapshot.val());
				if (initDate) {
					itemsArray = itemsArray.filter((item) => {
						const itemDate = new Date(item.date + "T00:00:00").getTime();
						return itemDate >= initDate.getTime();
					});
				}
				if (endDate) {
					itemsArray = itemsArray.filter((item) => {
						const itemDate = new Date(item.date + "T00:00:00").getTime();
						return itemDate <= endDate.getTime();
					});
				}
				if (userId) {
					itemsArray = itemsArray.filter((item) => item.user_id === userId);
				}

				itemsArray.forEach((item) => {
					if (!keyMap[item.calculator_type]) {
						keyMap[item.calculator_type] = 1;
						return;
					}

					keyMap[item.calculator_type]++;
				});

				const filteredArray = Object.keys(keyMap).map((key) => ({
					displayName: key,
					viewCount: keyMap[key],
				}));

				resolve(filteredArray);
			});
	});
};
