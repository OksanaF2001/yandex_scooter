import configuration
import data
import requests


def create_order():
    return requests.post(configuration.URL_SERVICE + configuration.CREATE_ORDER,
                         params=data.order_data,
                         headers=data.headers)


def get_order_by_track_number(track_number):
    return requests.get(configuration.URL_SERVICE + configuration.GET_ORDER_BY_TRACK_NUMBER % track_number,
                        headers=data.headers)
