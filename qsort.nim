import lists,
       random,
       math

proc fillUnsortedList(unsortedItems : var seq[int]) =
  var i = 0
  while i < unsortedItems.len :
    unsortedItems[i] = random(10)
    inc(i)

proc getMediana(unsortedItems : seq[int], l, r : int) : int = 
  var min, max = unsortedItems[l]
  var i = l
  while i < r :
    var item = unsortedItems[i]
    if item < min : 
      min = item
    else:
      if item > max :
        max = item
    inc(i)
  ((max + min) / 2).int

proc quicksort(unsortedItems : var seq[int]) =
  var operations = initDoublyLinkedList[tuple[l : int, r : int]]()
  prepend(operations, (l : 0, r : unsortedItems.high))

  while operations.head != nil :
    var operation = operations.head.value
    remove(operations, operations.head)
    
    var left = operation.l
    var right = if operation.r >= 0 : operation.r else : unsortedItems.high

    if (right - left + 1) < 2  :
      continue

    var mediana = getMediana(unsortedItems, left, right)

    while left <= right :
      if unsortedItems[left] < mediana :
        inc(left)
        continue

      if unsortedItems[right] > mediana : 
        dec(right)
        continue

      if left <= right:
        swap(unsortedItems[left], unsortedItems[right])
        inc(left)
        dec(right)
      
    prepend(operations, (l : operation.l, r : right))
    prepend(operations, (l : left, r : operation.r))          

proc main() =
  var unsortedItems = newSeq[int](100)
  fillUnsortedList(unsortedItems)
  echo unsortedItems
  quicksort(unsortedItems)
  echo unsortedItems

main()