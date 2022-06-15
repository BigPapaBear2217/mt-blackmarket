# mt-blackmarket
Simple black market script for QBCore with level system

# Preview: 
https://www.youtube.com/watch?v=3NYRlG2zlQc

# Installation:

Add to qb-core/server/player.lua
```
    PlayerData.metadata['blackmarketlevel'] = PlayerData.metadata['blackmarketlevel'] or 0
```

Add to qb-smallresource/server/logs.lua
```
    ['blackmarket'] = '',
 ```

# Dependicies:
- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-menu - https://github.com/qbcore-framework/qb-menu
