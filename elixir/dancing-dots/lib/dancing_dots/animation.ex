defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts :: opts()) :: {:ok, opts :: opts()} | {:error, error :: error()}
  @callback handle_frame(dot :: dot(), frame_number :: frame_number(), opts :: opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  def handle_frame(dot, frame_number, _opts) do
    new_opacity = if(Integer.mod(frame_number, 4) == 0, do: dot.opacity / 2, else: dot.opacity)
    %{dot | opacity: new_opacity}
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  def init(opts) do
    velocity = Keyword.get(opts, :velocity)

    if is_integer(velocity) do
      {:ok, opts}
    else
      {:error,
       "The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"}
    end
  end

  def handle_frame(dot, frame_number, opts) do
    %{dot | radius: dot.radius + (frame_number - 1) * opts[:velocity]}
  end
end
