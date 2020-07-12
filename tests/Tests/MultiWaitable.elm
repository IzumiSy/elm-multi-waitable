module Tests.MultiWaitable exposing (suite)

import Expect
import MultiWaitable
import Test exposing (Test, describe, test)


type A
    = DoneA


type B
    = DoneB


type C
    = DoneC


type D
    = DoneD


type Msg
    = Wait2Done A B
    | Wait3Done A B C
    | Wait4Done A B C D


suite : Test
suite =
    describe "MultiWaitable"
        [ test "Wait2" <|
            \_ ->
                MultiWaitable.init2 Wait2Done
                    |> MultiWaitable.wait2Update1_internal DoneA
                    |> Tuple.first
                    |> MultiWaitable.wait2Update2_internal DoneB
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                MultiWaitable.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        , test "Wait3" <|
            \_ ->
                MultiWaitable.init3 Wait3Done
                    |> MultiWaitable.wait3Update1_internal DoneA
                    |> Tuple.first
                    |> MultiWaitable.wait3Update2_internal DoneB
                    |> Tuple.first
                    |> MultiWaitable.wait3Update3_internal DoneC
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                MultiWaitable.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        , test "Wait4" <|
            \_ ->
                MultiWaitable.init4 Wait4Done
                    |> MultiWaitable.wait4Update1_internal DoneA
                    |> Tuple.first
                    |> MultiWaitable.wait4Update2_internal DoneB
                    |> Tuple.first
                    |> MultiWaitable.wait4Update3_internal DoneC
                    |> Tuple.first
                    |> MultiWaitable.wait4Update4_internal DoneD
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                MultiWaitable.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        ]
