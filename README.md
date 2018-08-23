# bcrypt_elixir_10
A minimal working example, reproducing [`bcrypt_elixir`'s issue #10](https://github.com/riverrun/bcrypt_elixir/issues/10).

Looks for the `bcrypt_elixir` dependency in a sibling folder. Change this in `mix.exs` if necessary.

# Setup and Run

1. Make sure the relevant versions are active. The issue reproduces on Elixir `1.6.6`, `1.7.2`, `OTP ~> 20`, and `bcrypt_elixir ~> 1.0.7`. There is `.tool-versions` file in place in case you use [asdf](https://github.com/asdf-vm/asdf).

2. Make sure `bcrypt_elixir` dependency is in a sibling folder. If that's not what you want, update your `mix.exs`.

```elixir
# change this

defp deps do
  [
    {:bcrypt_elixir, path: "../bcrypt_elixir"}
  ]
end

# to this

defp deps do
  [
    {:bcrypt_elixir, "~> 1.0.9"}
  ]
end
```

3. Install dependencies
```bash
mix deps.get
```

4. Start the app
```bash
./start.sh
```

5. Observe the output. The app will terminate as soon as `bcrypt_elixir` throws but, due to asyncronous nature of `IO.inspect` output, the actual error will likely be scrolled out.
