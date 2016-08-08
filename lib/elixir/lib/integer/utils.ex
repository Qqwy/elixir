defmodule Integer.Utils do
    @moduledoc false


    # guard-safe `max` operation, `a` and `b` need to be integers.
    # defmacro guard_safe_int_max(a, b) do
    #   quote do 
    #     div((unquote(a) + unquote(b)) + abs(unquote(a) - unquote(b)), 2)
    #   end
    # end

    # guard-safe `sign` operation, as long as both `a` and `b` are integers.
    # To prevent division-by-zero of the naïve `div(x, abs(x))` solution, observe that:
    #  x == 0  -> max(abs(0), 1) == 1, and div(0, 1) == 0, which is the desired result
    #  x != 0  -> max(abs(x), 1) == abs(x), 
    # so `max(abs(x), 1)` is substituted for `abs(x)`.
    # defmacro int_sign(x) do
    #   quote do
    #     div(unquote(x), guard_safe_int_max(abs(unquote(x)), 1))
    #   end
    # end

    # Integer Floor Division, 
    # Erlang's BIF `div/2` rounds towards zero.
    # `floor_div/2` always rounds down.
    # see https://en.wikipedia.org/wiki/Modulo_operation
    defmacro floor_div(a, n) do
      quote do
        div(unquote(a), unquote(n)) + 
        div(div(rem(unquote(a), unquote(n)) * unquote(n), div((abs(rem(unquote(a), unquote(n)) * unquote(n)) + 1) + abs(abs(rem(unquote(a), unquote(n)) * unquote(n)) - 1), 2)) - 1, 2)
      end
    end

    # rem(unquote(a), unquote(n)) * unquote(n)
    # abs(rem(unquote(a), unquote(n)) * unquote(n))
    # 1

  end
