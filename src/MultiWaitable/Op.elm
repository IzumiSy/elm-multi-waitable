module MultiWaitable.Op exposing
    ( Op(..)
    , toCmd
    )

import Task


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
