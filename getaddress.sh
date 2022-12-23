#!/bin/bash


POSITIONAL_ARGS=()
divide=1
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--host)
      host="$2"
      shift # past argument
      shift # past value
      ;;
     -d|--divide)
      divide="$2"
      shift # past argument
      shift # past value
      ;;
    -a|--address)
      address="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done
value=$(mbpoll $host -a 1 -r $address -1 -t 3 -0 | tail -2 | grep ":" | awk '{print $2}'i)
echo "scale=2 ; $value / $divide" | bc

