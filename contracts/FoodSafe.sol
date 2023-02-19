// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract FoodSafe {
    struct Location {
        string Name;
        uint8 LocationId;
        uint8 PreviousLocationId;
        uint256 TimeStamp;
        string Secret;
    }

    mapping(uint8 => Location) Trail;
    uint8 TrailCount = 0;

    function GetTrailcount() public view returns (uint8) {
        return TrailCount;
    }

    function AddNewLocation(
        uint8 locationId,
        string memory name,
        string memory secret
    ) public {
        Location memory newLocation;

        newLocation.Name = name;
        newLocation.LocationId = locationId;
        newLocation.Secret = secret;
        newLocation.TimeStamp = block.timestamp;

        if (TrailCount != 0) {
            newLocation.PreviousLocationId = Trail[TrailCount].LocationId;
        }
        Trail[TrailCount] = newLocation;
        TrailCount++;
    }

    function GetLocation(uint8 trailNumber)
        public
        view
        returns (
            string memory,
            uint8,
            uint8,
            uint256,
            string memory
        )
    {
        Location storage location = Trail[trailNumber];
        return (
            location.Name,
            location.LocationId,
            location.PreviousLocationId,
            location.TimeStamp,
            location.Secret
        );
    }
}
