// Copyright (c) 2018 The Dash Core developers
// Copyright (c) 2019 The BitGreen Core developers
// Copyright (c) 2019 The PineCoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PINECOIN_SPECIAL_UTIL
#define PINECOIN_SPECIAL_UTIL

#include <primitives/transaction.h>
#include <coins.h>

bool GetUTXOCoin(const COutPoint& outpoint, Coin& coin);
int GetUTXOHeight(const COutPoint& outpoint);
int GetUTXOConfirmations(const COutPoint& outpoint);

#endif // PINECOIN_SPECIAL_UTIL
