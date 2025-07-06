# PCNet NDIS Driver

The LanMan installer wouldn't let me choose this directory as an "Other Adapter" so I installed using the first 3Com option then, instead of rebooting, copied `PCNTND.DOS` to `C:\NET`, then changed all the `ELNK`s entries in `C:\NET\PROTOCOL.INI` to `PCNTND`.

I also changed the driver in `C:\NET\SYSTEM.INI`'s `[network drivers]` section to `pcntnd.dos`. 
