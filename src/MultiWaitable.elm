module MultiWaitable exposing
    ( Wait2, init2, wait2Update1, wait2Update2, Results2(..), toResults2
    , Wait3, init3, wait3Update1, wait3Update2, wait3Update3, Results3(..), toResults3
    , Wait4, init4, wait4Update1, wait4Update2, wait4Update3, wait4Update4, Results4(..), toResults4
    , Wait5, init5, wait5Update1, wait5Update2, wait5Update3, wait5Update4, wait5Update5, Results5, toResults5
    )

{-|


# Wait2

@docs Wait2, init2, wait2Update1, wait2Update2, Results2, toResults2


# Wait3

@docs Wait3, init3, wait3Update1, wait3Update2, wait3Update3, Results3, toResults3


# Wait4

@docs Wait4, init4, wait4Update1, wait4Update2, wait4Update3, wait4Update4, Results4, toResults4


# Wait5

@docs Wait5, init5, wait5Update1, wait5Update2, wait5Update3, wait5Update4, wait5Update5, Results5, toResults5

-}

import MultiWaitable.Internal as Internal



-- Wait2


{-| -}
type Wait2 msg a b
    = Wait2 (Internal.Wait2 msg a b)


{-| -}
init2 : (a -> b -> msg) -> Wait2 msg a b
init2 onFinished =
    Wait2 <| Internal.Wait2 onFinished Nothing Nothing


{-| -}
wait2Update1 : a -> Wait2 msg a b -> ( Wait2 msg a b, Cmd msg )
wait2Update1 a_ (Wait2 wait) =
    wait
        |> Internal.wait2Update1 a_
        |> Tuple.mapFirst Wait2
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait2Update2 : b -> Wait2 msg a b -> ( Wait2 msg a b, Cmd msg )
wait2Update2 b_ (Wait2 wait) =
    wait
        |> Internal.wait2Update2 b_
        |> Tuple.mapFirst Wait2
        |> Tuple.mapSecond Internal.toCmd


{-| -}
type Results2 a b
    = Results2 (Maybe a) (Maybe b)


{-| -}
toResults2 : Wait2 (a -> b -> msg) a b -> Results2 a b
toResults2 (Wait2 wait) =
    case Internal.toResults2 wait of
        Internal.Results2 a b ->
            Results2 a b



-- Wait3


{-| -}
type Wait3 msg a b c
    = Wait3 (Internal.Wait3 msg a b c)


{-| -}
init3 : (a -> b -> c -> msg) -> Wait3 msg a b c
init3 onFinished =
    Wait3 <| Internal.Wait3 onFinished Nothing Nothing Nothing


{-| -}
wait3Update1 : a -> Wait3 msg a b c -> ( Wait3 msg a b c, Cmd msg )
wait3Update1 a_ (Wait3 wait) =
    wait
        |> Internal.wait3Update1 a_
        |> Tuple.mapFirst Wait3
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait3Update2 : b -> Wait3 msg a b c -> ( Wait3 msg a b c, Cmd msg )
wait3Update2 b_ (Wait3 wait) =
    wait
        |> Internal.wait3Update2 b_
        |> Tuple.mapFirst Wait3
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait3Update3 : c -> Wait3 msg a b c -> ( Wait3 msg a b c, Cmd msg )
wait3Update3 c_ (Wait3 wait) =
    wait
        |> Internal.wait3Update3 c_
        |> Tuple.mapFirst Wait3
        |> Tuple.mapSecond Internal.toCmd


{-| -}
type Results3 a b c
    = Results3 (Maybe a) (Maybe b) (Maybe c)


{-| -}
toResults3 : Wait3 msg a b c -> Results3 a b c
toResults3 (Wait3 wait) =
    case Internal.toResults3 wait of
        Internal.Results3 a b c ->
            Results3 a b c



-- Wait4


{-| -}
type Wait4 msg a b c d
    = Wait4 (Internal.Wait4 msg a b c d)


{-| -}
init4 : (a -> b -> c -> d -> msg) -> Wait4 msg a b c d
init4 onFinished =
    Wait4 <| Internal.Wait4 onFinished Nothing Nothing Nothing Nothing


{-| -}
wait4Update1 : a -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update1 a_ (Wait4 wait) =
    wait
        |> Internal.wait4Update1 a_
        |> Tuple.mapFirst Wait4
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait4Update2 : b -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update2 b_ (Wait4 wait) =
    wait
        |> Internal.wait4Update2 b_
        |> Tuple.mapFirst Wait4
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait4Update3 : c -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update3 c_ (Wait4 wait) =
    wait
        |> Internal.wait4Update3 c_
        |> Tuple.mapFirst Wait4
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait4Update4 : d -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update4 d_ (Wait4 wait) =
    wait
        |> Internal.wait4Update4 d_
        |> Tuple.mapFirst Wait4
        |> Tuple.mapSecond Internal.toCmd


{-| -}
type Results4 a b c d
    = Results4 (Maybe a) (Maybe b) (Maybe c) (Maybe d)


{-| -}
toResults4 : Wait4 msg a b c d -> Results4 a b c d
toResults4 (Wait4 wait) =
    case Internal.toResults4 wait of
        Internal.Results4 a b c d ->
            Results4 a b c d



-- Wait5


{-| -}
type Wait5 msg a b c d e
    = Wait5 (Internal.Wait5 msg a b c d e)


{-| -}
init5 : (a -> b -> c -> d -> e -> msg) -> Wait5 msg a b c d e
init5 onFinished =
    Wait5 <| Internal.Wait5 onFinished Nothing Nothing Nothing Nothing Nothing


{-| -}
wait5Update1 : a -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Cmd msg )
wait5Update1 a_ (Wait5 wait) =
    wait
        |> Internal.wait5Update1 a_
        |> Tuple.mapFirst Wait5
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait5Update2 : b -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Cmd msg )
wait5Update2 b_ (Wait5 wait) =
    wait
        |> Internal.wait5Update2 b_
        |> Tuple.mapFirst Wait5
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait5Update3 : c -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Cmd msg )
wait5Update3 c_ (Wait5 wait) =
    wait
        |> Internal.wait5Update3 c_
        |> Tuple.mapFirst Wait5
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait5Update4 : d -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Cmd msg )
wait5Update4 d_ (Wait5 wait) =
    wait
        |> Internal.wait5Update4 d_
        |> Tuple.mapFirst Wait5
        |> Tuple.mapSecond Internal.toCmd


{-| -}
wait5Update5 : e -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Cmd msg )
wait5Update5 e_ (Wait5 wait) =
    wait
        |> Internal.wait5Update5 e_
        |> Tuple.mapFirst Wait5
        |> Tuple.mapSecond Internal.toCmd


{-| -}
type Results5 a b c d e
    = Results5 (Maybe a) (Maybe b) (Maybe c) (Maybe d) (Maybe e)


{-| -}
toResults5 : Wait5 msg a b c d e -> Results5 a b c d e
toResults5 (Wait5 wait) =
    case Internal.toResults5 wait of
        Internal.Results5 a b c d e ->
            Results5 a b c d e
