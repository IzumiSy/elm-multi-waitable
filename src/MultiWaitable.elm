module MultiWaitable exposing
    ( Wait2, init2, wait2Update1, wait2Update2, Results2(..), toResults2
    , Wait3, init3, wait3Update1, wait3Update2, wait3Update3, Results3(..), toResults3
    , Wait4, init4, wait4Update1, wait4Update2, wait4Update3, wait4Update4, Results4(..), toResults4
    , wait2Update1_internal, wait2Update2_internal, wait3Update1_internal, wait3Update2_internal, wait3Update3_internal, wait4Update1_internal, wait4Update2_internal, wait4Update3_internal, wait4Update4_internal, Op(..)
    )

{-|


# Wait2

@docs Wait2, init2, wait2Update1, wait2Update2, Results2, toResults2


# Wait3

@docs Wait3, init3, wait3Update1, wait3Update2, wait3Update3, Results3, toResults3


# Wait4

@docs Wait4, init4, wait4Update1, wait4Update2, wait4Update3, wait4Update4, Results4, toResults4

-}

import Task



-- Wait2


{-| -}
type Wait2 msg a b
    = Wait2 (a -> b -> msg) (Maybe a) (Maybe b)


{-| -}
init2 : (a -> b -> msg) -> Wait2 msg a b
init2 onFinished =
    Wait2 onFinished Nothing Nothing


{-| -}
wait2Update1 : a -> Wait2 msg a b -> ( Wait2 msg a b, Cmd msg )
wait2Update1 a_ wait2 =
    wait2
        |> wait2Update1_internal a_
        |> Tuple.mapSecond toCmd


wait2Update1_internal : a -> Wait2 msg a b -> ( Wait2 msg a b, Op msg )
wait2Update1_internal a_ wait2 =
    case wait2 of
        Wait2 _ (Just _) (Just _) ->
            ( wait2, None )

        Wait2 onFinished _ (Just b) ->
            ( Wait2 onFinished (Just a_) (Just b), Finished (onFinished a_ b) )

        Wait2 onFinished _ Nothing ->
            ( Wait2 onFinished (Just a_) Nothing, None )


{-| -}
wait2Update2 : b -> Wait2 msg a b -> ( Wait2 msg a b, Cmd msg )
wait2Update2 b_ wait2 =
    wait2
        |> wait2Update2_internal b_
        |> Tuple.mapSecond toCmd


wait2Update2_internal : b -> Wait2 msg a b -> ( Wait2 msg a b, Op msg )
wait2Update2_internal b_ wait2 =
    case wait2 of
        Wait2 _ (Just _) (Just _) ->
            ( wait2, None )

        Wait2 onFinished (Just a) _ ->
            ( Wait2 onFinished (Just a) (Just b_), Finished (onFinished a b_) )

        Wait2 onFinished Nothing _ ->
            ( Wait2 onFinished Nothing (Just b_), None )


{-| -}
type Results2 a b
    = Results2 (Maybe a) (Maybe b)


{-| -}
toResults2 : Wait2 (a -> b -> msg) a b -> Results2 a b
toResults2 (Wait2 _ a b) =
    Results2 a b



-- Wait3


{-| -}
type Wait3 msg a b c
    = Wait3 (a -> b -> c -> msg) (Maybe a) (Maybe b) (Maybe c)


{-| -}
init3 : (a -> b -> c -> msg) -> Wait3 msg a b c
init3 onFinished =
    Wait3 onFinished Nothing Nothing Nothing


{-| -}
wait3Update1 : a -> Wait3 msg a b c -> ( Wait3 msg a b c, Cmd msg )
wait3Update1 a_ wait3 =
    wait3
        |> wait3Update1_internal a_
        |> Tuple.mapSecond toCmd


wait3Update1_internal : a -> Wait3 msg a b c -> ( Wait3 msg a b c, Op msg )
wait3Update1_internal a_ wait3 =
    case wait3 of
        Wait3 _ (Just _) (Just _) (Just _) ->
            ( wait3, None )

        Wait3 onFinished Nothing (Just b) (Just c) ->
            ( Wait3 onFinished (Just a_) (Just b) (Just c), Finished (onFinished a_ b c) )

        Wait3 onFinished _ b c ->
            ( Wait3 onFinished (Just a_) b c, None )


{-| -}
wait3Update2 : b -> Wait3 msg a b c -> ( Wait3 msg a b c, Cmd msg )
wait3Update2 b_ wait3 =
    wait3
        |> wait3Update2_internal b_
        |> Tuple.mapSecond toCmd


wait3Update2_internal : b -> Wait3 msg a b c -> ( Wait3 msg a b c, Op msg )
wait3Update2_internal b_ wait3 =
    case wait3 of
        Wait3 _ (Just _) (Just _) (Just _) ->
            ( wait3, None )

        Wait3 onFinished (Just a) Nothing (Just c) ->
            ( Wait3 onFinished (Just a) (Just b_) (Just c), Finished (onFinished a b_ c) )

        Wait3 onFinished a _ c ->
            ( Wait3 onFinished a (Just b_) c, None )


{-| -}
wait3Update3 : c -> Wait3 msg a b c -> ( Wait3 msg a b c, Cmd msg )
wait3Update3 c_ wait3 =
    wait3
        |> wait3Update3_internal c_
        |> Tuple.mapSecond toCmd


wait3Update3_internal : c -> Wait3 msg a b c -> ( Wait3 msg a b c, Op msg )
wait3Update3_internal c_ wait3 =
    case wait3 of
        Wait3 _ (Just _) (Just _) (Just _) ->
            ( wait3, None )

        Wait3 onFinished (Just a) (Just b) Nothing ->
            ( Wait3 onFinished (Just a) (Just b) (Just c_), Finished (onFinished a b c_) )

        Wait3 onFinished a b _ ->
            ( Wait3 onFinished a b (Just c_), None )


{-| -}
type Results3 a b c
    = Results3 (Maybe a) (Maybe b) (Maybe c)


{-| -}
toResults3 : Wait3 msg a b c -> Results3 a b c
toResults3 (Wait3 _ a b c) =
    Results3 a b c



-- Wait4


{-| -}
type Wait4 msg a b c d
    = Wait4 (a -> b -> c -> d -> msg) (Maybe a) (Maybe b) (Maybe c) (Maybe d)


{-| -}
init4 : (a -> b -> c -> d -> msg) -> Wait4 msg a b c d
init4 onFinished =
    Wait4 onFinished Nothing Nothing Nothing Nothing


{-| -}
wait4Update1 : a -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update1 a_ wait4 =
    wait4
        |> wait4Update1_internal a_
        |> Tuple.mapSecond toCmd


wait4Update1_internal : a -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update1_internal a_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished Nothing (Just b) (Just c) (Just d) ->
            ( Wait4 onFinished (Just a_) (Just b) (Just c) (Just d), Finished (onFinished a_ b c d) )

        Wait4 onFinished _ b c d ->
            ( Wait4 onFinished (Just a_) b c d, None )


{-| -}
wait4Update2 : b -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update2 b_ wait4 =
    wait4
        |> wait4Update2_internal b_
        |> Tuple.mapSecond toCmd


wait4Update2_internal : b -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update2_internal b_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished (Just a) Nothing (Just c) (Just d) ->
            ( Wait4 onFinished (Just a) (Just b_) (Just c) (Just d), Finished (onFinished a b_ c d) )

        Wait4 onFinished a _ c d ->
            ( Wait4 onFinished a (Just b_) c d, None )


{-| -}
wait4Update3 : c -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update3 c_ wait4 =
    wait4
        |> wait4Update3_internal c_
        |> Tuple.mapSecond toCmd


wait4Update3_internal : c -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update3_internal c_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished (Just a) (Just b) Nothing (Just d) ->
            ( Wait4 onFinished (Just a) (Just b) (Just c_) (Just d), Finished (onFinished a b c_ d) )

        Wait4 onFinished a b _ d ->
            ( Wait4 onFinished a b (Just c_) d, None )


{-| -}
wait4Update4 : d -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Cmd msg )
wait4Update4 d_ wait4 =
    wait4
        |> wait4Update4_internal d_
        |> Tuple.mapSecond toCmd


wait4Update4_internal : d -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update4_internal d_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished (Just a) (Just b) (Just c) Nothing ->
            ( Wait4 onFinished (Just a) (Just b) (Just c) (Just d_), Finished (onFinished a b c d_) )

        Wait4 onFinished a b c _ ->
            ( Wait4 onFinished a b c (Just d_), None )


{-| -}
type Results4 a b c d
    = Results4 (Maybe a) (Maybe b) (Maybe c) (Maybe d)


{-| -}
toResults4 : Wait4 msg a b c d -> Results4 a b c d
toResults4 (Wait4 _ a b c d) =
    Results4 a b c d



-- internals


{-| Op type is like a wrapper for Elm's Cmd which is not testable.
All internal functions above use Op instead of Cmd in order to achieve testablity.
Exposed funstions use `toCmd` below which finally interprets Op into Cmd as a final piece.
-}
type Op msg
    = None
    | Finished msg


toCmd : Op msg -> Cmd msg
toCmd op =
    case op of
        None ->
            Cmd.none

        Finished msg ->
            Task.perform identity <| Task.succeed msg
