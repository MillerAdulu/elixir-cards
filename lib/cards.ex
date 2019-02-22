defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings that represents a deck of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do
        "#{value} of #{suit}"
    end

  end

  @doc """
  Returns a list of a shuffled deck of cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Returns a boolean value of whether a card exists in a deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Returns a list of dealt cards
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
  Saves a deck of cards into local storage
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  Returns a deck of cards in local storage
  """
  def load(filename) do

    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term binary
      { :error, _reason } -> "Something went wrong"
    end

  end

  @doc """
  Returns a list of dealt cards

  ## Examples

      iex> { hand, remainder } = Cards.create_hand(3)
      iex> hand
      ["Ace of Diamonds", "Two of Hearts", "Four of Spades"]

  """
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
