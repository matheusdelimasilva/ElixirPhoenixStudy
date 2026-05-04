defmodule TaskerWeb.CounterLive do
  use TaskerWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", _params, socket) do
    {:noreply, update(socket, :count, fn x -> x+1 end)}
  end

  def handle_event("decrement", _params, socket) do
    {:noreply, update(socket, :count, fn x -> x-1 end)}
  end

  def handle_event("reset", _params, socket) do
    {:noreply, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~H"""
    <main class="mx-auto mt-20 max-w-lg rounded-xl border border-zinc-200 p-8 text-center shadow-sm">
      <h1 class="text-3xl font-bold text-white">Counter</h1>

      <p class="mt-6 text-6xl font-semibold text-white">
        {@count}
      </p>

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
