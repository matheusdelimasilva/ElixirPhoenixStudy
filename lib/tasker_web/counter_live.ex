defmodule TaskerWeb.CounterLive do
  use TaskerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0, step: 1)}
  end

  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, fn x -> x + socket.assigns.step end)}
  end

  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, fn x -> x - socket.assigns.step end)}
  end

  def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, count: 0)}
  end

  def handle_event("change_step", params, socket) do
    %{"step" => step} = params
    step = case Integer.parse(step) do
      {int, _rest} when int > 0 -> int
      _ -> 1
    end
    {:noreply, assign(socket, step: step)}
  end

  def render(assigns) do
    ~H"""
    <main class="mx-auto mt-20 max-w-lg rounded-xl border border-zinc-200 p-8 text-center shadow-sm">
      <h1 class="text-3xl font-bold text-white">Counter</h1>

      <p class="mt-6 text-6xl font-semibold text-white">
        {@count}
      </p>

      <form phx-change="change_step" class="mt-6">
        <label for ="step" class="block text-sm font-medium text-white">
          Step size
        </label>
        <input
          id="step"
          name="step"
          type="number"
          min="1"
          value={@step}
          class="mt-2 w-24 rounded-lg border border-zinc-300 px-3 py-2 text-center"
        />
      </form>

      <div class="mt-8 flex justify-center gap-3">
        <button
          phx-click="decrement"
          class="rounded-lg bg-zinc-200 px-4 py-2 font-medium text-zinc-900 hover:bg-zinc-300"
        >
          -
        </button>

        <button
          phx-click="reset"
          class="rounded-lg bg-white px-4 py-2 font-medium text-zinc-900 hover:bg-zinc-300"
        >
          Reset
        </button>

        <button
          phx-click="increment"
          class="rounded-lg bg-zinc-200 px-4 py-2 font-medium text-zinc-900 hover:bg-zinc-300"
        >
          +
        </button>
      </div>
    </main>
    """
  end

end
