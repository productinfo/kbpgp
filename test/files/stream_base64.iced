
{armor} = require '../../'

#---------------------------------------------------------------------

msg = """
-----BEGIN PGP MESSAGE-----
Version: GnuPG v1

owEBSQK2/ZANAwACAS/gHEVDSNo5AcsZYgBTyzLsdGVzdCBtZXNzYWdlIDEgMiAz
CokCHAQAAQIABgUCU8sy7AAKCRAv4BxFQ0jaObtKD/4uxOcz9Ivo8YQMmY7mgUAn
sTAzcUsLn2y0LUurAIAez0BtgRSyDPdl02DSicsjVXGELUL1CAEKZkQ5fyzMUmnO
y13BjON2k985E549gsTZULNn2ZP8KSkN5rKarsyWr7ZA9BrBjSocbt2AT9ce8GAj
cuvIEwbk38RllLbyWMhZ0t1OJnl4pymbjpMUb/NsUnRFwwmmpHP8dmkhIk4zRlMI
QfsIGz26DtaotzdPyQ90loQBHnVicpL9thuu3d43sG/GE0HJE0a7Q2Obl9nEjZRq
7TfS9vI7vTrdQnqPXeSJVh0PBADMPO2nm2scqHLX/u9azrXpqSFxYJvJwZItvjVJ
OxKlE1Yxd6e46P1lE2HHut62XrRrri0no6BnHxWa8BAq2p0brQOGt6c/vTlMp1ck
Rb+D7pZv7ZuRJb8w/rBsv7nQG8uuq2axr4IxKmpMRgjiGIHQp2UD+9jUr3meF5+x
phlkygGN6GILkWKWEg/mj47ciBqLKV+CYpWRcyzeucTkE/LQaxaMYpzLOwMVqkyX
F2FAhCJAH8fCNJCy07vHOfVs7Tp9N5bCiw4+fmPnsudAzgcSFm+3AEHdNmLhGLYl
DDzZoVz3MsImZzGXbGwYFTxo5rv1e1o0qwCBMRm9W9faQJMCwtP6TfW0K16vKFJD
UnZPtobSm8qqDh3CFPKpmg==
=m+Ki
-----END PGP MESSAGE-----
"""

#---------------------------------------------------------------------

class SlowWriter

  constructor : ({@buf, @sink, @chunk_size}) ->
    @chunk_size or= 7
    @i = 0

  pipe : (cb) ->
    err = null
    while @i < @buf.length
      end = @i + @chunk_size
      await @sink.write @buf[@i...end], defer err
      break if err?
      await setTimeout defer(), 10
    cb err

#---------------------------------------------------------------------

exports.dearmor64 = (T,cb) ->
  cb()

#---------------------------------------------------------------------
