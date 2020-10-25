from model.calculator_view import CalculatorView
from dao.dao_mysql import get_all, insert
from dto.calculator_view_dto import CalculatorViewDTO


def add_calculator_view(current_date, uid, calculator_type):
    calculator_view = CalculatorView(current_date, uid, calculator_type)
    insert(calculator_view)


def get_all_calculator_views():
    calculator_views = get_all(CalculatorView)
    return format_json(calculator_views)


def format_json(calculator_views):
    calculator_view_json = []

    for calculator_view in calculator_views:
        calculator_view = calculator_view.__dict__

        calculator_view_json.append(CalculatorViewDTO(
            calculator_view['id'],
            calculator_view['date'].isoformat(),
            calculator_view['uid'],
            calculator_view['calculator_type']
        ).__dict__)

    return calculator_view_json
