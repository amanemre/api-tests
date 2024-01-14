def get_greetings
  @test_step.method = "GET"
  @test_step.path = "/greetings"
  @test_step.send_request
  assert_http_code(200)
end
