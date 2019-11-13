import test_project
import gleam/expect

pub fn hello_world_test() {
  test_project.hello_world()
  |> expect.equal(_, "Hello, from test_project!")
}
