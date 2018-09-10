#!/usr/bin/env python
# -*- coding:utf-8 -*-

from sqlalchemy import and_
from sqlalchemy import Column, BOOLEAN, VARCHAR, INT, TIMESTAMP
from sqlalchemy.sql import func

from schema.tables.base import BaseTable
from common.utils import guid
from common.utils import now


class Vuln(BaseTable):

    __tablename__ = 'vuln'

    uid = Column(VARCHAR(32), primary_key=True, default=guid)
    pid = Column(VARCHAR(32))
    name = Column(VARCHAR(200))
    desc = Column(VARCHAR(1000))
    created = Column(TIMESTAMP, default=now)

    @classmethod
    def add(cls, name, target, desc):
        p = Vuln()
        p.name = name
        p.target = target
        p.desc = desc
        cls.db.add(p)
        cls.db.commit()
        return True
