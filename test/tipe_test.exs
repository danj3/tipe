defmodule TipeTest do
  use ExUnit.Case
  doctest Tipe

  import Tipe

  test "v1" do
    a =
      :error
      ~> Atom.to_string()

    assert a == :error
  end

  test "v2" do
    a =
      14
      ~> Kernel.+(7)
      ~> Kernel.-(7)

    assert a == 14
  end

  test "v3" do
    a =
      14
      |> Kernel.+(7)
      |> then(&{:error, &1})
      ~> Kernel.-(7)

    assert a == {:error, 21}
  end
end
