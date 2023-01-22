# Inofficial Cypher System Character Sheet built in Flutter

This is a personal side project to build an inofficial digital character sheet
for the Pen and Paper Cypher System by "Monte Cook Games, LLC".

I am developing this in a personal capacity and best effort basis. Consider it a
fun learning project for myself to support a game I enjoy and hopefully learn
flutter on the way.
The project is not related to my professional work in any way and provided
free of charge and royalties under an open license.

## Screenshots

Check this [album](https://imgur.com/a/HqjKtSr) for a few screenshots of the app.

## Design Principles

The general idea behind this app is to provide a relatively simple interface
for playing a character in a Cypher System game.

There is an intentional lack in "logic" that would automate parts of game play.
The app is not intended to provide any dice roll mechanic or active helpers for
interacting with the world. It is a character sheet.

Some logic is still fine, where it reduces toil and interaction complexity.
For example, increasing the recovery bonus when gaining a tier.

The idea is to follow the Cypher Systems general flair of leaving the players
in control of their game.

From a UI perspective the app is also built on top of flutter material widgets,
but trying to keep it's own flair and simple interface.
This is partially for style, but also for learning flutter on my part.

## Storage and Connectivity

All data stored by the app is by default offline. The project is using
[protobuf](https://developers.google.com/protocol-buffers) to persist and
potentially transfer data.

### Persistence

The main piece of information handled by the app is Characters. While that
includes other types of objects connected to a Character (Cyphers, Items, etc.)
everything starts with a Character.

The app is using the application data on its local platform (Android, Windows)
and creates a folder for each Character. The folder is named after a unique ID
assigned to each Character.

Inside that folder the app persists "Revisions" or versions of that character
in a strictly incremental order.
So if a Character is created it is stored in a file with the name `0`. When it
is updated a new file is created named `1` with the new version of that
Character.

The files are encoded using
[protobuf](https://developers.google.com/protocol-buffers) and contain a full
snapshot of a character at this point in time.

This way there is a ongoing history for every Character. The protobuf protocol
also allows to keep Characters safe between updates of the app, as it helps
to make changes in a backwards compatible way.

In case anything during an upgrade goes wrong, this mode for persistence allows
to export and backup Characters in other means. Even sharing them across devices
is technically possible and planned for the future.

Every change to a character, no matter how small will result in a new revision.
Increase a pool, level up, get a new item, everything is a new revision that
can be saved and eventually reverted to.
At some point there may be the need for an automated cleanup mechanism, but
so far Characters are still fairly small in my tests.

#### Web Support

Due to the underlying storage mechanism used right now, web is not supported out
of the box. While web support is planned, it requires a service behind it that
does all the necessary authentication and storage of characters.

### Sharing and Sync

One idea behind the persistence design is that a (not yet implemented) server
can be used by players to also send any changes to it.
This way syncing a player would just be an additional way of saving a Character.
Data would still remain offline first, but if a player lost their device or
wants to share access to a Character they could pull their remote save.

That same service is also intended to be used for other useful game play
features.

For example, if a player wants to give an item to another Character, they could
use this server and share it that way. And as everything is protobuf messages
passing things between apps, servers, etc. becomes really simple.

Even shared inventories (like storage in a player base) is possible that way.

In theory players can even share items, cyphers etc. via files and their
favorite messaging service.

Again the idea is to develop a very open and flexible platform that allows
people to run what they need and want.

### Remote Data

Similar to the sharing and syncing idea, a GM could have a catalog of items,
cyphers and abilities they want to make available to their group.
The app is open to that and can allow access to a sort of database that players
can exchange things with.

While this is meant for smaller groups to share their internal creations,
a game creator could leverage the same idea and open license of this project
to provide access to content for their game right inside the app.

## Using this Project

First and foremost this project is meant to be used by players.
If you are running or participating in a cypher compatible game, please feel
free to try this out.

I'd love to get feedback and hear about your experience. Feel free to open
issues here on GitHub with any bugs you will find and someone (including me)
may be able to address them.

If you are a game creator and would like to use this project, the license
generally allows you to do so. Feel free to reach out if that is of interest
and if that results in the project growing and improving I'd love to see it
happen.

Right now the app is not published on any app store and binaries still need
to be made available outside the internal testing system
([#7](https://github.com/kwiesmueller/cypher_sheet/issues/7#issue-1551553202)).
But I'm happy to talk about options here.

## Contributing

The primary goal of this project is to provide a fun solution for a game between
a group of friends. But there may be other people out there willing to use and
contribute.

I'd be happy to collaborate with anyone interested in contributing and would
especially love support from people with more experience in flutter and UI/UX
design.

If you are interested in contributing, please reach out in the form of issues
or via Discord: Finch#7490

## License

The project and its code are licensed under the MIT License attached in
[LICENSE](LICENSE).

This project is about the Pen and Paper RPG Cypher System
by Monte Cook Games, LLC.
It is following the
[Cypher System Open License](https://csol.montecookgames.com/license/).

Numenera, the Cypher System, No Thank You, Evil!, Invisible Sun, and their
respective logos are trademarks of Monte Cook Games, LLC in the U.S.A. and
other countries. All Monte Cook Games characters and character names, and
the distinctive likenesses thereof, are trademarks of Monte Cook Games, LLC.
Content derived from Monte Cook Games publications is
© 2013-2022 Monte Cook Games, LLC.

![compatible with the cypher system](https://csol.montecookgames.com/wp-content/uploads/2022/07/Compatible-with-the-Cypher-System-Logo-color-small.png)
