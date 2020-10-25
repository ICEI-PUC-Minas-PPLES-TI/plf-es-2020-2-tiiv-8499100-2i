from model.symbol_view import SymbolView
from dao.dao_mysql import get_all, insert
from dto.symbol_view_dto import SymbolViewDTO

def add_symbol_view(current_date, uid, viewability, symbol_id):
    symbol_view = SymbolView(current_date, uid, viewability, symbol_id)
    insert(symbol_view)


def get_all_symbol_views():
    symbol_views = get_all(SymbolView)
    return format_json(symbol_views)


def format_json(symbol_views):
    symbol_view_json = []

    for symbol_view in symbol_views:
        symbol_view = symbol_view.__dict__

        symbol_view_json.append(SymbolViewDTO(
            symbol_view['id'],
            symbol_view['date'].isoformat(),
            symbol_view['uid'],
            symbol_view['viewability'],
            symbol_view['symbol_id']
        ).__dict__)

    return symbol_view_json
