from dto.ad_dto import AdDTO
from model.ad import Ad
from dao.dao_mysql import insert, get_all, get, update, delete
from credentials import storage


def add_ad(text, img, url):
    img_path = storage.upload_image_file(img, "ad")

    ad = Ad(text, img_path, url)
    insert(ad)


def get_all_ads():
    ads = get_all(Ad)
    return format_json(ads)


def get_ad(id):
    ad = get(Ad, id)
    ad = ad.__dict__
    return AdDTO(ad['id'], ad['text'], ad['img']).__dict__


def update_ad(id, text, img):
    ad = Ad(text, img)
    update(Ad, id, ad)


def delete_ad(id):
    delete(Ad, id)


def format_json(ads):
    ads_json = []

    for ad in ads:
        ad = ad.__dict__
        ads_json.append(AdDTO(ad['id'], ad['text'], ad['img'], ad['url']).__dict__)
    return ads_json
