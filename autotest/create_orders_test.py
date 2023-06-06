import order_request


def test_order():
    created_order = order_request.create_order()
    track_number = created_order.json()['track']

    order = order_request.get_order_by_track_number(track_number)

    assert order.status_code == 200
