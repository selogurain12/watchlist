declare class Events {
    id: string;
    date: Date;
    eventStatus?: 'Pending' | 'Accepted' | 'Declined';
    eventType: 'RemoteWork' | 'PaidLeave';
    eventDescription?: string;
    userId: string;
}
