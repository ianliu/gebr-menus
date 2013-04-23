sed '
   s/^afilf [^0-9]*/Alias filter frequency if used...................... /
   s/^afils [^0-9]*/Alias filter slope.................................. /
s/^shortpad [^0-9]*/Alignment padding................................... /
    s/^cdpt [^0-9]*/Trace number within CDP ensemble.................... /
     s/^cdp [^0-9]*/CDP ensemble number................................. /
  s/^counit [^0-9]*/Coordinate units code............................... /
    s/^corr [^0-9]*/Correlated flag..................................... /
    s/^duse [^0-9]*/Data use............................................ /
    s/^gdel [^0-9]*/Datum elevation at receiver group................... /
    s/^sdel [^0-9]*/Datum elevation at source........................... /
     s/^day [^0-9]*/Day of year......................................... /
   s/^delrt [^0-9]*/Delay recording time in ms.......................... /
      s/^ep [^0-9]*/Energy source point number.......................... /
    s/^fldr [^0-9]*/Field record number................................. /
    s/^mute [^0-9]*/Final mute time..................................... /
      s/^f1 [^0-9]*/First sample location for non-seismic data.......... /
      s/^f2 [^0-9]*/First trace location................................ /
    s/^gain [^0-9]*/Gain type of field instruments code................. /
    s/^gaps [^0-9]*/Gap size............................................ /
  s/^grnlof [^0-9]*/Geophone group number of last trace within original\n field record....................................... /
  s/^grnors [^0-9]*/Geophone group number of roll switch position one... /
  s/^grnofr [^0-9]*/Geophone group number of trace one within original\n field record....................................... /
   s/^gstat [^0-9]*/Group static correction............................. /
     s/^hcf [^0-9]*/High cut frequncy if used........................... /
     s/^hcs [^0-9]*/High cut slope...................................... /
    s/^hour [^0-9]*/Hour of day (24 hour clock)......................... /
    s/^muts [^0-9]*/Initial mute time................................... /
     s/^igi [^0-9]*/Instrument early or initial gain.................... /
     s/^igc [^0-9]*/Instrument gain constant............................ /
    s/^laga [^0-9]*/Lag time A.......................................... /
    s/^lagb [^0-9]*/Lag time B.......................................... /
     s/^lcf [^0-9]*/Low cut frequency if used........................... /
     s/^lcs [^0-9]*/Low cut slope....................................... /
    s/^mark [^0-9]*/Mark selected traces................................ /
  s/^minute [^0-9]*/Minute of hour...................................... /
  s/^ungpow [^0-9]*/Negative of power used for dynamic range compression /
  s/^nofilf [^0-9]*/Notch filter frequency if used...................... /
  s/^nofils [^0-9]*/Notch filter slope.................................. /
     s/^nhs [^0-9]*/Number of horizontally summed traces................ /
      s/^ns [^0-9]*/Number of samples................................... /
     s/^ntr [^0-9]*/Number of traces.................................... /
     s/^nvs [^0-9]*/Number of vertically summed traces.................. /
  s/^offset [^0-9]*/Offset (signed distance from source to receiver).... /
   s/^otrav [^0-9]*/Overtravel taper code............................... /
   s/^gelev [^0-9]*/Receiver group elevation from sea level............. /
 s/^unscale [^0-9]*/Reciprocal of scaling factor to normalize range..... /
      s/^dt [^0-9]*/Sampling interval in microseconds................... /
      s/^d2 [^0-9]*/Sample spacing between traces....................... /
      s/^d1 [^0-9]*/Sample spacing for non-seismic data................. /
  s/^scalco [^0-9]*/Scale factor for source\/receiver coordinates........ /
  s/^scalel [^0-9]*/Scale factor for source\/receiver elevations,\n datum and water depth.............................. /
     s/^sec [^0-9]*/Second of minute.................................... /
  s/^sdepth [^0-9]*/Source depth (positive)............................. /
   s/^selev [^0-9]*/Source elevation from sea level..................... /
   s/^sstat [^0-9]*/Source static correction............................ /
  s/^swevel [^0-9]*/Subweathering velocity.............................. /
     s/^sfe [^0-9]*/Sweep frequency at end.............................. /
     s/^sfs [^0-9]*/Sweep frequency at start............................ /
    s/^slen [^0-9]*/Sweep length in ms.................................. /
    s/^stae [^0-9]*/Sweep trace length at end in ms..................... /
    s/^stas [^0-9]*/Sweep trace length at start in ms................... /
    s/^styp [^0-9]*/Sweep type code..................................... /
   s/^tatyp [^0-9]*/Taper type.......................................... /
  s/^timbas [^0-9]*/Time basis code..................................... /
   s/^tstat [^0-9]*/Total static applied................................ /
    s/^trid [^0-9]*/Trace identification code........................... /
   s/^tracf [^0-9]*/Trace number sequence within field record........... /
   s/^tracl [^0-9]*/Trace number sequence within line................... /
   s/^tracr [^0-9]*/Trace number sequence within reel................... /
    s/^trwf [^0-9]*/Trace weighting factor.............................. /
     s/^gut [^0-9]*/Uphole time at receiver group....................... /
     s/^sut [^0-9]*/Uphole time at source............................... /
   s/^gwdep [^0-9]*/Water depth at receiver group....................... /
   s/^swdep [^0-9]*/Water depth at source............................... /
   s/^wevel [^0-9]*/Weathering velocity................................. /
      s/^gx [^0-9]*/X group coordinate.................................. /
      s/^sx [^0-9]*/X source coordinate................................. /
      s/^gy [^0-9]*/Y group coordinate.................................. /
      s/^sy [^0-9]*/Y source coordinate................................. /
    s/^year [^0-9]*/Year data recorded.................................. /'
