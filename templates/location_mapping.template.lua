-- This file is generated, do not edit!
-- Instead see templates/item_mapping.template.lua and <apworld>/logic/locations.lisp

LOCATION_MAPPING = {
{%- for id, name in location_mapping.items() %}
  [{{ id }}] = { "{{ name }}" },
{%- endfor %}
}
