When(/^I retrieve welcome greeting$/) do
  get_greetings
end

When(/^greeting content contains "([^"]*)"$/) do | message |
  assert_message_contains(message)
end
