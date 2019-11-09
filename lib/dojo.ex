defmodule Dojo do
  def build_board(name, items \\ []) do
    %Board{name: name, items: items}
  end

  def build_item(description, done \\ false) do
    %Item{description: description, done: done}
  end

  def add_item_to_board(%{name: name, items: items}, new_item) do
    build_board(name, [new_item | items] ) 
  end

  def remove_item_from_board(%{name: name, items: items}, item_to_remove) do
    # usar o módulo Enum
    #Enum.reject([1, 2, 3], fn x -> rem(x, 2) == 0 end)
    build_board(name, Enum.reject(items, fn i -> i == item_to_remove end))
  end

  def mark_item_as_done(board, undone_item) do
    # usar pipe
    #new_board = remove_item_from_board(board, undone_item)
    #add_item_to_board(new_board, %{description: undone_item.description, done: true})

    board 
    |> remove_item_from_board(undone_item)
    |> add_item_to_board(done(undone_item)) 
  end

  def mark_item_as_undone(board, done_item) do
    # 
    board
    |> remove_item_from_board(done_item)
    |> add_item_to_board(undone(done_item)) 
  end

  def done(item) do
    # atualizar uma Struct (mapa)
    %Item{item | done: true}
  end

  def undone(item) do
    #
    %Item{item | done: false }
  end
end
