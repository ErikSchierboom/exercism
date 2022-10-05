# New Passport

Welcome to New Passport on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The [special form with][with] provides a way to focus on the "happy path" of a series of potentially failing steps and deal with the failures later.

```elixir
with {:ok, id} <- get_id(username),
     {:ok, avatar} <- fetch_avatar(id),
     {:ok, image_type} <- check_valid_image_type(avatar) do
  {:ok, image_type, avatar}
else
  :not_found ->
    {:error, "invalid username"}

  {:error, "not an image"} ->
    {:error, "avatar associated to #{username} is not an image"}

  err ->
    err
end
```

At each step, if a clause matches, the chain will continue until the `do` block is executed. If one match fails, the chain stops and the non-matching clause is returned. You have the option of using an `else` block to catch failed matches and modify the return value.

[with]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1

## Instructions

Your passport is about to expire, so you need to drop by the city office to renew it. You know from previous experience that your city office is not necessarily the easiest to deal with, so you decide to do your best to always "focus on the happy path".

You print out the form you need to get your new passport, fill it out, jump into your car, drive around the block, park and head to the office.

All the following tasks will require implementing and extending `get_new_passport/3`.

## 1. Get into the building

It turns out that the building is only open in the afternoon, and not at the same time everyday.

Call the function `enter_building/1` with the current time (given to you as first argument of `get_new_passport/3`). If the building is open, the function will return a tuple with `:ok` and a timestamp that you will need later, otherwise a tuple with `:error` and a message. For now, the happy path can return the `:ok` tuple.

If you get an `:error` tuple, use the `else` block to return it.

## 2. Go to the information desk and find which counter you should go to

The information desk is notorious for taking long coffee breaks. If you are lucky enough to find someone there, they will give you an instruction manual which will explain which counter you need to go to depending on your birth date.

Call the function `find_counter_information/1` with the current time. You will get either a tuple with `:ok` and a manual, represented by an anonymous function, or a tuple with `:coffee_break` and more instructions. In your happy path where you receive the manual, apply it to you birthday (second argument of `get_new_passport/3`). It will return the number of the counter where you need to go. Return an `:ok` tuple with that counter number.

If you get a `:coffee_break` message, return a tuple with `:retry` and a `NaiveDateTime` pointing to 15 minutes after the current time. As before, if you get an `:error` tuple, return it.

## 3. Go to the counter and get your form stamped

For some reason, different counters require forms of different colors. Of course, you printed the first one you found on the website, so you focus on your happy path and hope for the best.

Call the function `stamp_form/3` with the timestamp you received at the entrance, the counter and the form you brought (last argument of `get_new_passport/3`). You will get either a tuple with `:ok` and a checksum that will be used to verify your passport number or a tuple with `:error` and a message. Have your happy path return an `:ok` tuple with the checksum. If you get an `:error` tuple, return it.

## 4. Receive your new passport

Finally, you have all the documents you need.

Call `get_new_passport_number/3` with the timestamp, the counter and the checksum you received earlier. You will receive a string with your final passport number, all that is left to do is to return that string in a tuple with `:ok` and go home.

## Source

### Created by

- @jiegillet

### Contributed to by

- @angelikatyborska