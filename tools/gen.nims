# Switches for `nim c tools/gen.nim`.
switch("compileOnly")                       # the work happens at compile time
switch("define", "futharkRebuild")          # overwrite the existing output file
switch("define", "opirRebuild")             # re-read the headers
switch("define", "nodeclguards")            # plain declarations: no guards, no numeric suffixes
switch("define", "noopaquetypes")           # needed for the hand-declared `cs_mode`
switch("maxLoopIterationsVM", "50000000")   # the default limit is too low for these headers
switch("hints", "off")
