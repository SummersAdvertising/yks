# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Define.create(usetype: 'usertype', name: '管理者')
Define.create(usetype: 'usertype', name: '一般')
User.create(user: 'master', password: '81fe8bfe87576c3ecb22426f8e57847382917acf', define_id: 1)

SystemSiteMap.create(system_site_map_id: 0, is_static: false, controller: 'home', action: 'index', title: 'home')
SystemSiteMap.create(system_site_map_id: 1, is_static: false, title: '服務管理')
