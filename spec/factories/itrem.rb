FactoryBot.define do
  after(:build) do |item|
    item.image.attach(io:File.open('publid/images/test_image.png'),filename:'test_image.png')
    
  end
end
