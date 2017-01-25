import lists
import random

proc generate_unsorted_list[T](count: int) : SinglyLinkedList[T] =
  var unsorted_list = initSinglyLinkedList[T]()
  var i = 0
  while i < count:
    var random_item = random(1000)
    unsorted_list.prepend(random_item)
    inc(i)
  unsorted_list

proc main() =
  var items: SinglyLinkedList[int]
  items = generate_unsorted_list[int](100)
  echo("unsorted collection : ", items)

main()

