json.id  event.id
json.title event.title
json.start event.start
json.end event.end
# json.custom_event.dogs event.custom_event.dogs

json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)
