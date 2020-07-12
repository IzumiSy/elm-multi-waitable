module Tests.MultiWaitable exposing (suite)

import Expect
import MultiWaitable.Internal as Internal
import Test exposing (Test, describe, test)


type A
    = DoneA


type B
    = DoneB


type C
    = DoneC


type D
    = DoneD


type E
    = DoneE


type Msg
    = Wait2Done A B
    | Wait3Done A B C
    | Wait4Done A B C D
    | Wait5Done A B C D E


suite : Test
suite =
    describe "MultiWaitable.Internal"
        [ test "Wait2" <|
            \_ ->
                Internal.Wait2 Wait2Done Nothing Nothing
                    |> Internal.wait2Update1 DoneA
                    |> Tuple.first
                    |> Internal.wait2Update2 DoneB
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                Internal.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        , test "Wait3" <|
            \_ ->
                Internal.Wait3 Wait3Done Nothing Nothing Nothing
                    |> Internal.wait3Update1 DoneA
                    |> Tuple.first
                    |> Internal.wait3Update2 DoneB
                    |> Tuple.first
                    |> Internal.wait3Update3 DoneC
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                Internal.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        , test "Wait4" <|
            \_ ->
                Internal.Wait4 Wait4Done Nothing Nothing Nothing Nothing
                    |> Internal.wait4Update1 DoneA
                    |> Tuple.first
                    |> Internal.wait4Update2 DoneB
                    |> Tuple.first
                    |> Internal.wait4Update3 DoneC
                    |> Tuple.first
                    |> Internal.wait4Update4 DoneD
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                Internal.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        , test "Wait5" <|
            \_ ->
                Internal.Wait5 Wait5Done Nothing Nothing Nothing Nothing Nothing
                    |> Internal.wait5Update1 DoneA
                    |> Tuple.first
                    |> Internal.wait5Update2 DoneB
                    |> Tuple.first
                    |> Internal.wait5Update3 DoneC
                    |> Tuple.first
                    |> Internal.wait5Update4 DoneD
                    |> Tuple.first
                    |> Internal.wait5Update5 DoneE
                    |> Tuple.second
                    |> (\op ->
                            case op of
                                Internal.Finished _ ->
                                    True

                                _ ->
                                    False
                       )
                    |> Expect.true "Expected Op to be Finished"
        ]
