################################################################################
# Conversion 0
# Amplitude (V) to energy (keV)
################################################################################
def amp_to_energy(amplitude, calibration=0):

    energy = 0

    if calibration==0:

        #print "Using calibration 0"

        # Used for the low-energy channel
        energy = 63.7*amplitude


    elif calibration==1:

        #print "Using calibration 1"

        # Used for the higher-energy channel
        energy = (63.049*amplitude) + 0.12719

    elif calibration==2:

        #print "Using calibration 2"

        # Used for the higher-energy channel, when studying the K-shell peaks. Gives
        # a better fit to this region, but worse fit at low energies
        energy = (61.909*amplitude) + 0.28328

    return energy


################################################################################
################################################################################
