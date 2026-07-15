-- This file is generated, do not edit!
-- Instead see templates/item_mapping.template.lua and <apworld>/logic/items.lisp

ITEM_MAPPING = {
  -- only including progression items here
{%- for id, name in item_mapping.items() %}
  [{{ id }}] = { "{{ name }}", "toggle" },
{%- endfor %}
}
