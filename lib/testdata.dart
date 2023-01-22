import 'package:cypher_sheet/proto/character.pb.dart';

final finch = Character(
    uuid: "testdata-0000-0000",
    name: "Finch",
    descriptor: "clever",
    type: "Explorer",
    focus: "fuses mind and machine",
    color: CharacterColor(r: 75, g: 149, b: 236),
    progress: Progress(
      tier: 1,
      freeXp: 4,
      totalXp: 8,
      advancements: Advancements(
        moveTowardPerfection: true,
      ),
      maxEffort: 1,
    ),
    stats: Stats(
      intellect: Stat(type: PoolType.intellect, cap: 14, pool: 14, edge: 2),
      speed: Stat(type: PoolType.speed, cap: 14, pool: 14, edge: 1),
      might: Stat(type: PoolType.might, cap: 12, pool: 12, edge: 0),
    ),
    recovery: Recovery(bonus: 1, oneAction: true),
    damage: Damage(),
    skills: <Skill>[
      Skill(uuid: "1", name: "Programming", type: PoolType.intellect),
      Skill(uuid: "2", name: "Leverage Risks", type: PoolType.intellect),
      Skill(uuid: "3", name: "Infiltration", type: PoolType.speed),
      Skill(uuid: "4", name: "Initiative Tasks", type: PoolType.speed),
      Skill(uuid: "5", name: "Heavy Weapons", type: PoolType.might),
      Skill(uuid: "6", name: "Punching Things", type: PoolType.might),
    ],
    abilities: <Ability>[
      Ability(uuid: "1", name: "Hide", type: PoolType.intellect, cost: "2"),
      Ability(
          uuid: "2",
          name: "Example Ability",
          type: PoolType.speed,
          cost: "2+",
          shortDescription: "Does something really fast"),
      Ability(
          uuid: "3",
          name: "Otter Companion",
          type: PoolType.intellect,
          enabler: true,
          shortDescription: "Bear the Otter!"),
    ],
    cypherLimit: 2,
    cyphers: <Cypher>[
      Cypher(
        uuid: "1",
        name: "Speed Boost",
        level: "5",
        effect: "Add 2 to speed edge for one hour",
        shortDescription: "Add 2 to speed edge for one hour",
        active: true,
        internal: "Grafted to body",
        depletion: "1 in 1d10",
      ),
      Cypher(
        uuid: "2",
        name: "Test Cypher",
        level: "2",
        effect: "Does nothing",
        shortDescription: "Does nothing at all",
        active: false,
      ),
    ],
    artifacts: [
      Artifact(
        uuid: "3",
        name: "Special Artifact",
        level: "9",
        effect: "Does a really special thing.",
        active: false,
        form: "4-foot (1 m) tall box with a big red button in the center",
        depletion: "1 in 1d20",
      ),
    ],
    money: 342,
    inventories: [
      Inventory(uuid: "Self", name: "Self", order: 0),
      Inventory(uuid: "Backpack", name: "Backpack", order: 1),
      Inventory(uuid: "Home", name: "Home / Storage", order: 2),
    ],
    items: [
      Item(
        path: ItemPath(inventory: "Self", self: "1"),
        name: "Gun",
        shortDescription: "Shoots projectiles at long range",
        types: [ItemType.weapon],
        subItemType: ItemType.ammo,
      ),
      Item(
        path: ItemPath(inventory: "Self", parent: "1", self: "2"),
        name: "Standard Dart",
        types: [ItemType.ammo],
        amount: 11,
      ),
      Item(
        path: ItemPath(inventory: "Self", parent: "1", self: "3"),
        name: "Fire Dart",
        types: [ItemType.ammo],
        description:
            "Has a flammable tip that causes fire damage to soft targets\nDoes not penetrate armor",
        amount: 32,
      ),
      Item(
        path: ItemPath(inventory: "Self", self: "4"),
        name: "Light Armor",
        types: [ItemType.armor],
        armor: 1,
      ),
      Item(
        path: ItemPath(inventory: "Self", self: "5"),
        name: "Ascenders/Descenders",
        types: [ItemType.tool],
      ),
      Item(
        path: ItemPath(inventory: "Backpack", self: "6"),
        name: "Wolfram",
        types: [ItemType.material],
        amount: 0.5,
      ),
      Item(
        path: ItemPath(inventory: "Backpack", self: "7"),
        name: "Steel",
        types: [ItemType.material],
        amount: 0.5,
      ),
      Item(
        path: ItemPath(inventory: "Home", self: "8"),
        name: "Exo Suit",
        shortDescription:
            "Powered exo suit that provides extra armor and stronger melee attacks",
        types: [ItemType.weapon, ItemType.armor],
      ),
    ]);
