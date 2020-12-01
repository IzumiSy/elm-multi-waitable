module MultiWaitable.Internal exposing
    ( Op(..)
    , Results2(..)
    , Results3(..)
    , Results4(..)
    , Results5(..)
    , Wait2(..)
    , Wait3(..)
    , Wait4(..)
    , Wait5(..)
    , toCmd
    , toResults2
    , toResults3
    , toResults4
    , toResults5
    , wait2Update1
    , wait2Update2
    , wait3Update1
    , wait3Update2
    , wait3Update3
    , wait4Update1
    , wait4Update2
    , wait4Update3
    , wait4Update4
    , wait5Update1
    , wait5Update2
    , wait5Update3
    , wait5Update4
    , wait5Update5
    )

import Task



-- Wait2


type Wait2 msg a b
    = Wait2 (a -> b -> msg) (Maybe a) (Maybe b)


wait2Update1 : a -> Wait2 msg a b -> ( Wait2 msg a b, Op msg )
wait2Update1 a_ wait2 =
    case wait2 of
        Wait2 _ (Just _) (Just _) ->
            ( wait2, None )

        Wait2 onFinished _ (Just b) ->
            ( Wait2 onFinished (Just a_) (Just b), Finished (onFinished a_ b) )

        Wait2 onFinished _ Nothing ->
            ( Wait2 onFinished (Just a_) Nothing, None )


wait2Update2 : b -> Wait2 msg a b -> ( Wait2 msg a b, Op msg )
wait2Update2 b_ wait2 =
    case wait2 of
        Wait2 _ (Just _) (Just _) ->
            ( wait2, None )

        Wait2 onFinished (Just a) _ ->
            ( Wait2 onFinished (Just a) (Just b_), Finished (onFinished a b_) )

        Wait2 onFinished Nothing _ ->
            ( Wait2 onFinished Nothing (Just b_), None )


type Results2 a b
    = Results2 (Maybe a) (Maybe b)


toResults2 : Wait2 msg a b -> Results2 a b
toResults2 (Wait2 _ a b) =
    Results2 a b



-- Wait3


type Wait3 msg a b c
    = Wait3 (a -> b -> c -> msg) (Maybe a) (Maybe b) (Maybe c)


wait3Update1 : a -> Wait3 msg a b c -> ( Wait3 msg a b c, Op msg )
wait3Update1 a_ wait3 =
    case wait3 of
        Wait3 _ (Just _) (Just _) (Just _) ->
            ( wait3, None )

        Wait3 onFinished Nothing (Just b) (Just c) ->
            ( Wait3 onFinished (Just a_) (Just b) (Just c), Finished (onFinished a_ b c) )

        Wait3 onFinished _ b c ->
            ( Wait3 onFinished (Just a_) b c, None )


wait3Update2 : b -> Wait3 msg a b c -> ( Wait3 msg a b c, Op msg )
wait3Update2 b_ wait3 =
    case wait3 of
        Wait3 _ (Just _) (Just _) (Just _) ->
            ( wait3, None )

        Wait3 onFinished (Just a) Nothing (Just c) ->
            ( Wait3 onFinished (Just a) (Just b_) (Just c), Finished (onFinished a b_ c) )

        Wait3 onFinished a _ c ->
            ( Wait3 onFinished a (Just b_) c, None )


wait3Update3 : c -> Wait3 msg a b c -> ( Wait3 msg a b c, Op msg )
wait3Update3 c_ wait3 =
    case wait3 of
        Wait3 _ (Just _) (Just _) (Just _) ->
            ( wait3, None )

        Wait3 onFinished (Just a) (Just b) Nothing ->
            ( Wait3 onFinished (Just a) (Just b) (Just c_), Finished (onFinished a b c_) )

        Wait3 onFinished a b _ ->
            ( Wait3 onFinished a b (Just c_), None )


type Results3 a b c
    = Results3 (Maybe a) (Maybe b) (Maybe c)


toResults3 : Wait3 msg a b c -> Results3 a b c
toResults3 (Wait3 _ a b c) =
    Results3 a b c



-- Wait4


type Wait4 msg a b c d
    = Wait4 (a -> b -> c -> d -> msg) (Maybe a) (Maybe b) (Maybe c) (Maybe d)


wait4Update1 : a -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update1 a_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished Nothing (Just b) (Just c) (Just d) ->
            ( Wait4 onFinished (Just a_) (Just b) (Just c) (Just d), Finished (onFinished a_ b c d) )

        Wait4 onFinished _ b c d ->
            ( Wait4 onFinished (Just a_) b c d, None )


wait4Update2 : b -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update2 b_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished (Just a) Nothing (Just c) (Just d) ->
            ( Wait4 onFinished (Just a) (Just b_) (Just c) (Just d), Finished (onFinished a b_ c d) )

        Wait4 onFinished a _ c d ->
            ( Wait4 onFinished a (Just b_) c d, None )


wait4Update3 : c -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update3 c_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished (Just a) (Just b) Nothing (Just d) ->
            ( Wait4 onFinished (Just a) (Just b) (Just c_) (Just d), Finished (onFinished a b c_ d) )

        Wait4 onFinished a b _ d ->
            ( Wait4 onFinished a b (Just c_) d, None )


wait4Update4 : d -> Wait4 msg a b c d -> ( Wait4 msg a b c d, Op msg )
wait4Update4 d_ wait4 =
    case wait4 of
        Wait4 _ (Just _) (Just _) (Just _) (Just _) ->
            ( wait4, None )

        Wait4 onFinished (Just a) (Just b) (Just c) Nothing ->
            ( Wait4 onFinished (Just a) (Just b) (Just c) (Just d_), Finished (onFinished a b c d_) )

        Wait4 onFinished a b c _ ->
            ( Wait4 onFinished a b c (Just d_), None )


type Results4 a b c d
    = Results4 (Maybe a) (Maybe b) (Maybe c) (Maybe d)


toResults4 : Wait4 msg a b c d -> Results4 a b c d
toResults4 (Wait4 _ a b c d) =
    Results4 a b c d



-- Wait5


type Wait5 msg a b c d e
    = Wait5 (a -> b -> c -> d -> e -> msg) (Maybe a) (Maybe b) (Maybe c) (Maybe d) (Maybe e)


wait5Update1 : a -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Op msg )
wait5Update1 a_ wait5 =
    case wait5 of
        Wait5 _ (Just _) (Just _) (Just _) (Just _) (Just _) ->
            ( wait5, None )

        Wait5 onFinished Nothing (Just b) (Just c) (Just d) (Just e) ->
            ( Wait5 onFinished (Just a_) (Just b) (Just c) (Just d) (Just e), Finished (onFinished a_ b c d e) )

        Wait5 onFinished _ b c d e ->
            ( Wait5 onFinished (Just a_) b c d e, None )


wait5Update2 : b -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Op msg )
wait5Update2 b_ wait5 =
    case wait5 of
        Wait5 _ (Just _) (Just _) (Just _) (Just _) (Just _) ->
            ( wait5, None )

        Wait5 onFinished (Just a) Nothing (Just c) (Just d) (Just e) ->
            ( Wait5 onFinished (Just a) (Just b_) (Just c) (Just d) (Just e), Finished (onFinished a b_ c d e) )

        Wait5 onFinished a _ c d e ->
            ( Wait5 onFinished a (Just b_) c d e, None )


wait5Update3 : c -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Op msg )
wait5Update3 c_ wait5 =
    case wait5 of
        Wait5 _ (Just _) (Just _) (Just _) (Just _) (Just _) ->
            ( wait5, None )

        Wait5 onFinished (Just a) (Just b) Nothing (Just d) (Just e) ->
            ( Wait5 onFinished (Just a) (Just b) (Just c_) (Just d) (Just e), Finished (onFinished a b c_ d e) )

        Wait5 onFinished a b _ d e ->
            ( Wait5 onFinished a b (Just c_) d e, None )


wait5Update4 : d -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Op msg )
wait5Update4 d_ wait5 =
    case wait5 of
        Wait5 _ (Just _) (Just _) (Just _) (Just _) (Just _) ->
            ( wait5, None )

        Wait5 onFinished (Just a) (Just b) (Just c) Nothing (Just e) ->
            ( Wait5 onFinished (Just a) (Just b) (Just c) (Just d_) (Just e), Finished (onFinished a b c d_ e) )

        Wait5 onFinished a b c _ e ->
            ( Wait5 onFinished a b c (Just d_) e, None )


wait5Update5 : e -> Wait5 msg a b c d e -> ( Wait5 msg a b c d e, Op msg )
wait5Update5 e_ wait5 =
    case wait5 of
        Wait5 _ (Just _) (Just _) (Just _) (Just _) (Just _) ->
            ( wait5, None )

        Wait5 onFinished (Just a) (Just b) (Just c) (Just d) Nothing ->
            ( Wait5 onFinished (Just a) (Just b) (Just c) (Just d) (Just e_), Finished (onFinished a b c d e_) )

        Wait5 onFinished a b c d _ ->
            ( Wait5 onFinished a b c d (Just e_), None )


type Results5 a b c d e
    = Results5 (Maybe a) (Maybe b) (Maybe c) (Maybe d) (Maybe e)


toResults5 : Wait5 msg a b c d e -> Results5 a b c d e
toResults5 (Wait5 _ a b c d e) =
    Results5 a b c d e



-- Op


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
