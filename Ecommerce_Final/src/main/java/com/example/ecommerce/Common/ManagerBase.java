package com.example.ecommerce.Common;

public abstract class ManagerBase implements IInitializable{
    protected final LogObj log = new LogObj();
    protected String logName = getClass().getName();

    @Override
    public void Initialize() {
        log.setName(logName);
        log.info("Initialize commerce...");

        startInitializeBehavior();
    }

    protected void endInitialize(boolean status) {
        log.info("Initialize completed with status:" + status);
        endInitializeBehavior();
    }

    protected abstract void startInitializeBehavior();
    protected abstract void endInitializeBehavior();
}