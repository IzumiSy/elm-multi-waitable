# elm-multi-waitable
> A small package like a traffic light

`MultiWaitable` module manages a state updated asynchronously.

## Example
```elm
-- model


type alias Model =
    MultiWaitable.Wait3 Msg User Options Bookmarks


init : Model
init =
    MultiWaitable.init3 AllFinished



-- update


type Msg
    = AllFinished
    | UserFetched User
    | OptionsFetched Options
    | BookmarksFetched Bookmarks


update : Model -> Msg -> ( Model, Cmd msg )
update model msg =
    case msg of
        UserFetched user ->
            MultiWaitable.update3Update1 user

        UserOptions options ->
            MultiWaitable.update3Update2 options

        BookmarksFetched bookmarks ->
            MultiWaitable.update3Update3 bookmarks

        AllFinished user options bookmarks ->
            -- ...
```

## Lisence
MIT

## Contribution
PRs accepted

## Prior Art
[0ui/elm-task-parallel](https://package.elm-lang.org/packages/0ui/elm-task-parallel/latest)
