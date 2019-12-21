#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

PINECOIND=${PINECOIND:-$BINDIR/pinecoind}
PINECOINCLI=${PINECOINCLI:-$BINDIR/pinecoin-cli}
PINECOINTX=${PINECOINTX:-$BINDIR/pinecoin-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/pinecoin-wallet}
PINECOINQT=${PINECOINQT:-$BINDIR/qt/pinecoin-qt}

[ ! -x $PINECOIND ] && echo "$PINECOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
read -r -a BTCVER <<< "$($PINECOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }')"

# Create a footer file with copyright content.
# This gets autodetected fine for pinecoind if --version-string is not set,
# but has different outcomes for pinecoin-qt and pinecoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$PINECOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $PINECOIND $PINECOINCLI $PINECOINTX $WALLET_TOOL $PINECOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
