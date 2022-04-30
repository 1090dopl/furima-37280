class Status < ActiveHash::Base
    self.data=[
      {id:0,name: '--'},
      {id:1,name: '未使用に近い'},
      {id:2,name: 'やや傷や汚れあり'},
      {id:3,name: '全体的に状態が悪い'}
    ]

    include ActiveHash::Associations
      has_many :items
  end