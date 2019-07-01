/// @function mt19937_init()
/// @description Initializes the Mersenne Twister with a default seed.
///				 Adapted from https://github.com/ESultanik/mtwister/blob/master/mtwister.c
global.rand_index = -1;
mt19937_seed(DEFAULT_SEED);