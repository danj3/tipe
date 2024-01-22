defmodule Tipe do
  @moduledoc """
  Here are tuple status pipes, an :error or {:error, _} will skip
  a `~>`

  `import Tipe`
  """

  @doc """
  Will skip execution on :error/{:error, _}

  To use:

  ```
  some_value
  |> regular_pipe_call()
  ~> non_error_call()
  ```

  The non_error_call will only be invoked when then
  result of regular_pipe_call is not `:error` or `{:error,_}`.

  """
  defmacro left ~> right do
    quote generated: true do
      case unquote(left) do
        {:error, _} = err ->
          err

        :error ->
          :error

        val ->
          unquote(Macro.pipe(quote(do: val), right, 0))
      end
    end
  end
end
