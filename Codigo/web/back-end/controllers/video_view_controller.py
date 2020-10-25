from datetime import date
from flask import Blueprint, request, jsonify, Response
from services import video_view_service

video_view = Blueprint('video_view', __name__)


@video_view.route("/video_view", methods=['POST'])
def insert():
    data = request.form
    current_date = date.today().strftime("%Y-%m-%d")
    user_id = data["uid"]
    video_id = data["video_id"]

    video_view_service.add_video_view(current_date, user_id, video_id)

    return Response(status=201)


@video_view.route("/video_view", methods=['GET'])
def get_all():
    response = video_view_service.get_all_video_views()
    return jsonify(response)

