import React from 'react';
import { cn } from '../../utils/cn';

type FlagProps = {
  countryCode: string;
  className?: string;
};

export const FlagIcon: React.FC<FlagProps> = ({ countryCode, className }) => {
  return (
    <img
      src={`https://flagcdn.com/${countryCode.toLowerCase()}.svg`}
      alt={`Bandera de ${countryCode}`}
      className={cn("inline-block w-10 h-7 rounded-sm object-cover shadow-sm flex-shrink-0", className)}    />
  );
};