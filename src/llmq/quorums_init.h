// Copyright (c) 2018-2019 The Dash Core developers
// Copyright (c) 2019 The BitGreen Core developers
// Copyright (c) 2019 The PineCoin Core developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef PINECOIN_LLMQ_QUORUMS_INIT_H
#define PINECOIN_LLMQ_QUORUMS_INIT_H

class CDBWrapper;
class CSpecialDB;
class CScheduler;

namespace llmq
{

// If true, we will connect to all new quorums and watch their communication
static const bool DEFAULT_WATCH_QUORUMS = false;

// Init/destroy LLMQ globals
void InitLLMQSystem(CSpecialDB& specialDb, CScheduler* scheduler, bool unitTests, bool fWipe = false);
void DestroyLLMQSystem();

// Manage scheduled tasks, threads, listeners etc.
void StartLLMQSystem();
void StopLLMQSystem();
void InterruptLLMQSystem();
}

#endif //PINECOIN_LLMQ_QUORUMS_INIT_H
