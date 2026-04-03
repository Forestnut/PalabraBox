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
      className={cn("inline-block w-12 min-w-12 h-8 rounded-sm object-cover shadow-sm shrink-0", className)}
    />
  );
};