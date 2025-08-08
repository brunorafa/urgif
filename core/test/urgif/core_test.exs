defmodule Urgif.CoreTest do
  use ExUnit.Case
  doctest Urgif.Core

  test "greets the world" do
    assert Urgif.Core.hello() == :world
  end
end
